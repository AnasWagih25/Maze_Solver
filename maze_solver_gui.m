%Author: Anas Wagih
%Date: 23/10/2024

function maze_solver_gui_custom()
    clc; close all;
    fig = figure('Name', 'Maze-Solving Robot', ...
        'Position', [100, 100, 400, 200], ...
        'NumberTitle', 'off', ...
        'MenuBar', 'none', ...
        'Resize', 'off');
    uicontrol(fig, 'Style', 'pushbutton', ...
        'String', 'Start Simulation', ...
        'Position', [50, 100, 120, 40], ...
        'Callback', @(~, ~) startSimulation());

    uicontrol(fig, 'Style', 'pushbutton', ...
        'String', 'End Simulation', ...
        'Position', [230, 100, 120, 40], ...
        'Callback', @(~, ~) close(fig));

    uicontrol(fig, 'Style', 'text', ...
        'String', 'Maze-Solving (DFS) Simulation', ...
        'FontSize', 12, ...
        'HorizontalAlignment', 'center', ...
        'Position', [50, 150, 300, 30]);

    function startSimulation()
        maze = createCustomMaze();
        solveMaze(maze);
    end
end

%Custom maze - the 1's are the walls and 0's are the paths for
%exploration
function maze = createCustomMaze()
    maze = [
        1 0 1 1 1 1 1 1 1 1 1;
        1 0 0 0 1 0 0 0 1 0 1;
        1 0 1 0 1 0 1 0 0 0 1;
        1 0 1 0 0 0 1 1 1 0 1;
        1 0 1 1 1 1 1 0 0 0 1;
        1 0 0 0 1 0 0 0 1 1 1;
        1 1 0 0 1 0 1 0 1 0 1;
        1 0 0 0 1 0 1 1 1 0 1;
        1 0 1 1 1 0 0 0 0 0 1;
        1 0 0 0 1 0 1 1 1 0 1;
        1 1 1 1 1 1 1 1 1 0 1;
    ];
end

%Using DFS we will start solving the maze
function solveMaze(maze)
    [rows, cols] = size(maze);
    start = [2, 2];  % Start position (row, col)
    goal = [10, 10]; % End position (row, col)
    visited = false(size(maze));
    path = [];

    figure('Name', 'Maze Solver', 'NumberTitle', 'off');
    colormap([1 1 1; 0 0 0]); % White for path, Black for wall
    imagesc(maze);
    hold on;
    title('Maze Solving in Progress...');
    pause(1);
    plot(2, 2, 'gs', 'MarkerSize', 10, 'MarkerFaceColor', 'g'); % Start (green)
    plot(10, 10, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % End (red)

    %DFS Recursive Function
    function found = dfs(pos)
        x = pos(1);
        y = pos(2);

        %Base Case: If goal is reached
        if isequal(pos, goal)
            path = [path; x, y]; %#ok<AGROW>
            found = true;
            return;
        end

        visited(x, y) = true;
        path = [path; x, y]; %#ok<AGROW>

        plot(y, x, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
        pause(0.1);

        %Possible moves: [down, up, right, left]
        moves = [1 0; -1 0; 0 1; 0 -1];

        %Explore each move
        for i = 1:size(moves, 1)
            newX = x + moves(i, 1);
            newY = y + moves(i, 2);

            if newX > 0 && newX <= rows && newY > 0 && newY <= cols && ...
                    maze(newX, newY) == 0 && ~visited(newX, newY)
                if dfs([newX, newY])
                    found = true;
                    return;
                end
            end
        end

        
        path(end, :) = [];
        found = false;
    end

    if dfs(start)
        disp('Path found!');
        title('Maze Solved!');
    else
        disp('No path found!');
        title('No Solution!');
    end

    for i = 1:size(path, 1)
        plot(path(i, 2), path(i, 1), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
        pause(0.1);
    end
    hold off;
end
