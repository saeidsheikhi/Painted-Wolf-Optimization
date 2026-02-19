"""
Painted Wolf Optimization (PWO) source codes version 1.0

Developed in Python (NumPy / Matplotlib)

Author and programmer: Saeid Sheikhi
e-Mail: Saeid.Sheikhi@oulu.fi
Homepage: saeid.dev

Main paper:
Saeid Sheikhi, "Painted Wolf Optimization: A Novel Nature-Inspired
Metaheuristic Algorithm for Real-World Optimization Problems",
Computers, Materials & Continua, 2026.
DOI: 10.32604/cmc.2026.077788
"""

import numpy as np
import matplotlib.pyplot as plt

from PWO import PWO


def sphere_function(x):
    return np.sum(x**2)


def main():
    npop = 30
    MaxIter = 500
    problem_dim = 10
    lower_bound = -100
    upper_bound = 100

    Best_score, Best_pos, cg_curve = PWO(
        npop, MaxIter, lower_bound, upper_bound, problem_dim, sphere_function
    )

    print("\n--- Final Results ---")
    print(f"Best Position: {Best_pos}")
    print(f"Best Score: {Best_score}")

    # Convergence plot (log-scale)
    eps = np.finfo(float).tiny 
    y = np.maximum(cg_curve, eps)

    plt.figure()
    plt.semilogy(y)  # log scale on y-axis
    plt.title("Convergence Curve (log scale)")
    plt.xlabel("Iteration")
    plt.ylabel("Best Score (log10 scale)")
    plt.grid(True, which="both")
    plt.show()

if __name__ == "__main__":
    main()
