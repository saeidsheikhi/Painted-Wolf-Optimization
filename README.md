# Painted Wolf Optimization (PWO)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repository contains the official Python and MATLAB source code for the Painted Wolf Optimization (PWO) algorithm, as presented in the paper "Painted Wolf Optimization: A Novel Nature-Inspired Metaheuristic Algorithm for Real-World Optimization Problems". PWO is a metaheuristic inspired by the unique group hunting and voting rally strategy of African painted wolves.

---

## Citation

If you use the PWO algorithm or code in your research, please cite our paper.

```bibtex
@article{Saeid_2025_pwo,
  title={Painted Wolf Optimization: A Novel Nature-Inspired Metaheuristic Algorithm for Real-World Optimization Problems},
  author={Saeid Sheikhi},
  journal={Computers, Materials \& Continua},
  year={2026},
  volume={Volume},
  pages={Pages}
}
```

## Features

- Implements the novel Painted Wolf Optimization (PWO) algorithm.
- Inspired by the cooperative hunting behavior of painted wolves.
- Balances exploration and exploitation through a unique voting rally mechanism.
- Suitable for solving complex, high-dimensional optimization problems.
- Provided in both Python and MATLAB for broad accessibility.

## Requirements

### Python Version
- Python 3.x
- NumPy

You can install the required Python library using pip:
```bash
pip install numpy
```

### MATLAB Version
- MATLAB R2016a or newer.

---

## How to Use

### Python

1.  Import the `PWO` function into your script.
2.  Define your objective function.
3.  Set the algorithm's parameters (population size, iterations, bounds, etc.).
4.  Call the `PWO` function.

**Example:**
```python
import numpy as np
from pwo import PWO # Assuming you save the code in a file named pwo.py

# Define a simple objective function (Sphere function)
def sphere_function(x):
    return np.sum(x**2)

# Set parameters for the algorithm
npop = 30           # Population size
MaxIter = 500       # Maximum number of iterations
problem_dim = 10    # Number of dimensions
lower_bound = -100  # Lower bound of the search space
upper_bound = 100   # Upper bound of the search space

# Run the PWO algorithm
Best_score, Best_pos, cg_curve = PWO(npop, MaxIter, lower_bound, upper_bound, problem_dim, sphere_function)

# Print the final results
print(f"Best Position Found: {Best_pos}")
print(f"Best Score Found: {Best_score}")
```

### MATLAB

1.  Ensure the `PWO.m` file is in your MATLAB path.
2.  Define your objective function (can be an anonymous function or a separate `.m` file).
3.  Set the parameters and call the function.

**Example:**
```matlab
% Define objective function
fobj = @(x) sum(x.^2);

% Set parameters
npop = 30;
MaxIter = 500;
dim = 10;
lb = -100;
ub = 100;

% Run the PWO algorithm
[Best_score, Best_pos, cg_curve] = PWO(npop, MaxIter, lb, ub, dim, fobj);

% Display results
fprintf('Best Score: %e\n', Best_score);
disp('Best Position:');
disp(Best_pos);
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
