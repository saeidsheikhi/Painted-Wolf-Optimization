import numpy as np

def PWO(num_agents, max_iterations, lb, ub, dim, fobj):
    """
    PWO - Painted Wolf Optimization Algorithm (Python Version)

    Parameters:
    ----------
    num_agents : int
        Number of search agents (pack size).
    max_iterations : int
        Maximum number of iterations.
    lb : float or list/numpy.ndarray
        Lower bound(s).
    ub : float or list/numpy.ndarray
        Upper bound(s).
    dim : int
        Problem dimension.
    fobj : function
        Objective function to be minimized.

    Returns:
    -------
    tuple
        Alpha_score (float), Alpha_pos (np.ndarray), Convergence_curve (np.ndarray)
    """

    # =========================================================================
    # 1. Initialization
    # =========================================================================
    VOTE_INCREMENT = 0.04  # Contribution of each wolf to the rally strength.

    Alpha_pos = np.zeros(dim)
    Alpha_score = float('inf')
    Alpha_index = 0

    # Create boundary vectors if scalar values are provided
    if isinstance(lb, (int, float)):
        lb_vec = np.full(dim, lb)
        ub_vec = np.full(dim, ub)
    else:
        lb_vec = np.array(lb)
        ub_vec = np.array(ub)

    Positions = lb_vec + np.random.rand(num_agents, dim) * (ub_vec - lb_vec)
    Costs = np.full(num_agents, float('inf'))

    Convergence_curve = np.zeros(max_iterations)
    print("PWO Algorithm starting...")
    print("Iter  |  Best Score Found")
    print("---------------------------")

    # =========================================================================
    # 2. Main Optimization Loop
    # =========================================================================
    for t in range(max_iterations):

        # Fitness Evaluation and Alpha Update
        for i in range(num_agents):
            Positions[i, :] = np.clip(Positions[i, :], lb_vec, ub_vec)

            fitness = fobj(Positions[i, :])
            Costs[i] = fitness

            if fitness < Alpha_score:
                Alpha_score = fitness
                Alpha_pos = Positions[i, :].copy()
                Alpha_index = i

        # 'a' linearly decreases from 2 to 0
        a = 2 * (1 - (t / max_iterations))

        # Voting Rally Simulation
        Alpha_influence = abs(VOTE_INCREMENT / a) if a != 0 else 0
        rally_strength = 0

        for i in range(num_agents):
            if i != Alpha_index:
                cost_comparison = Costs[i] - (Alpha_influence * Alpha_score)
                if cost_comparison <= Alpha_score:
                    rally_strength += VOTE_INCREMENT

        E0 = 2 * np.random.rand() - np.random.rand()
        rally_threshold = round((a * E0 / Alpha_influence + np.random.rand())) if Alpha_influence != 0 else 0

        # Position Update Mechanism
        for i in range(num_agents):
            for j in range(dim):
                r1, r2 = np.random.rand(), np.random.rand()
                A1 = 2 * a * r1 - a

                if rally_strength < rally_threshold:
                    # EXPLORATION
                    q = np.random.rand()
                    if q < 0.5:
                        rand_agent_idx = np.random.randint(0, num_agents)
                        X_rand = Positions[rand_agent_idx, :]

                        vel = 2 * Alpha_influence * r1 + r2
                        D_X_rand = abs(vel * X_rand[j] - Positions[i, j])

                        Positions[i, :] = X_rand[j] - A1 * D_X_rand
                    else:
                        mean_pos = np.mean(Positions, axis=0)
                        Positions[i, :] = (Alpha_pos - mean_pos) - rally_strength * abs(Alpha_pos - Positions[i, :])
                else:
                    # EXPLOITATION
                    D_alpha = abs(Alpha_pos[j] - Positions[i, j])
                    A2 = rally_strength + a * A1 * Alpha_influence
                    Positions[i, j] = Alpha_pos[j] - A2 * D_alpha

        Convergence_curve[t] = Alpha_score

        if (t + 1) % 20 == 0 or t == 0 or t == max_iterations - 1:
            print(f"{t+1:5d} |  {Alpha_score:e}")

    print("---------------------------")
    print("PWO Algorithm Finished.")
    print(f"Best Score Found: {Alpha_score}")

    return Alpha_score, Alpha_pos, Convergence_curve
