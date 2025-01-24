# Maze Solver (DFS)

This project provides a MATLAB-based GUI for solving a custom maze using the Depth-First Search (DFS) algorithm. The maze is represented as a 2D grid where 1's are walls, and 0's are paths that can be explored. Users can start the simulation, watch the maze being solved, and see the path from the start to the goal.

## Features

- **Custom Maze Creation**: The maze is defined with walls and paths. You can modify the maze by adjusting the matrix values.
- **DFS Algorithm**: Solves the maze using Depth-First Search, exploring each possible path until the goal is found or no path exists.
- **GUI Interface**: Provides a simple interface to start and stop the simulation, as well as display the maze and path found by DFS.
- **Path Visualization**: Shows the progress of the algorithm with markers for the start, goal, and explored paths.

## Requirements

- MATLAB (version R2014b or higher)

## Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/maze-solver-dfs.git
   ```

2. Open MATLAB and navigate to the cloned repository directory.

3. Run the GUI by typing the following command in the MATLAB Command Window:

   ```matlab
   maze_solver_gui_custom
   ```

## Usage

Once the GUI opens, you will see two buttons:

- **Start Simulation**: Begins the DFS algorithm to solve the maze.
- **End Simulation**: Closes the simulation window.

### How It Works

1. **Custom Maze**: The maze is pre-defined within the code as a 2D matrix. Modify the `createCustomMaze()` function to change the maze structure.
   - 1's represent walls.
   - 0's represent paths that can be traversed.

2. **DFS Solving**: The algorithm uses DFS to explore all possible paths from the starting point (top-left) to the goal (bottom-right). The solution path, if found, is displayed in green.

3. **Visualization**: The maze is shown graphically with the following:
   - **Green square**: Start position.
   - **Red circle**: Goal position.
   - **Blue circles**: Explored paths during the DFS.
   - **Green circles**: The solution path (if found).

## Example Workflow

1. Modify the maze matrix in the `createCustomMaze` function (if needed).
2. Click the **Start Simulation** button to begin solving the maze using DFS.
3. The path, if found, will be shown progressively in green.
4. Click **End Simulation** to close the simulation.

## Customizing the Maze

You can customize the maze by changing the values in the `createCustomMaze()` function. Example:

```matlab
maze = [
    1 0 1 1 1 1 1 1 1 1 1;
    1 0 0 0 1 0 0 0 1 0 1;
    1 0 1 0 1 0 1 0 0 0 1;
    ...
];
```

- `1` represents a wall.
- `0` represents a path.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

- **Anas Wagih**

## Acknowledgements

- MATLAB for providing the necessary tools to implement the GUI and DFS algorithm.
```

Make sure to replace `https://github.com/yourusername/maze-solver-dfs.git` with the actual URL of your repository! You can also update any specific sections as needed.
