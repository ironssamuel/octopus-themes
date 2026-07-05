// Octopus theme test — Go
// Representative of the cloud-native tooling world (Docker, Kubernetes,
// Terraform's own runtime are all written in Go) — adjacent to Octopus's
// own competitive space. Exercises: struct tags (backtick strings),
// interfaces, goroutines/channels, error handling idioms, generics.

package deploy

import (
	"context"
	"errors"
	"fmt"
	"time"
)

type Status int

const (
	Pending Status = iota
	Succeeded
	Failed
)

func (s Status) String() string {
	switch s {
	case Succeeded:
		return "succeeded"
	case Failed:
		return "failed"
	default:
		return "pending"
	}
}

type Release struct {
	Version     string    `json:"version"`
	Environment string    `json:"environment"`
	Status      Status    `json:"status"`
	DeployedAt  time.Time `json:"deployed_at,omitempty"`
}

type Deployer interface {
	Deploy(ctx context.Context, r *Release) error
}

var ErrMaxRetriesExceeded = errors.New("max retries exceeded")

type retryDeployer struct {
	inner       Deployer
	maxAttempts int
}

func (d *retryDeployer) Deploy(ctx context.Context, r *Release) error {
	var lastErr error
	for attempt := 1; attempt <= d.maxAttempts; attempt++ {
		if err := d.inner.Deploy(ctx, r); err != nil {
			lastErr = err
			fmt.Printf("attempt %d/%d failed: %v\n", attempt, d.maxAttempts, err)
			select {
			case <-time.After(time.Duration(attempt) * time.Second):
				continue
			case <-ctx.Done():
				return ctx.Err()
			}
		}
		return nil
	}
	return fmt.Errorf("%w: %v", ErrMaxRetriesExceeded, lastErr)
}

func fanOutHealthChecks(urls []string) <-chan bool {
	results := make(chan bool, len(urls))
	for _, url := range urls {
		go func(u string) {
			results <- checkHealth(u)
		}(url)
	}
	return results
}

func checkHealth(url string) bool {
	// placeholder for a real HTTP check
	return len(url) > 0
}

func Filter[T any](items []T, predicate func(T) bool) []T {
	var out []T
	for _, item := range items {
		if predicate(item) {
			out = append(out, item)
		}
	}
	return out
}

func main() {
	releases := []Release{
		{Version: "2.4.1", Environment: "production", Status: Succeeded},
		{Version: "2.4.2", Environment: "staging", Status: Failed},
	}

	healthy := Filter(releases, func(r Release) bool {
		return r.Status == Succeeded
	})

	fmt.Printf("%d of %d releases healthy\n", len(healthy), len(releases))
}
