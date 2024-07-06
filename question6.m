% Save this as rotate_image.m

% Function to rotate an image by a specified angle
function rotated_img = rotate_image(img, angle)
    % Arguments:
    %   img (matrix): The input image.
    %   angle (scalar): The angle by which to rotate the image (in degrees).
    
    % Get the original dimensions
    [orig_height, orig_width, num_channels] = size(img);
    
    % Convert the angle to radians
    angle_rad = deg2rad(angle);
    
    % Compute the transformation matrix for rotation
    T = [cos(angle_rad) -sin(angle_rad); sin(angle_rad) cos(angle_rad)];
    
    % Compute the corners of the rotated image
    corners = [1, 1; orig_width, 1; orig_width, orig_height; 1, orig_height];
    new_corners = (T * corners')';
    
    % Compute the new dimensions
    min_x = min(new_corners(:,1));
    max_x = max(new_corners(:,1));
    min_y = min(new_corners(:,2));
    max_y = max(new_corners(:,2));
    
    new_width = round(max_x - min_x);
    new_height = round(max_y - min_y);
    
    % Create a new image to hold the rotated result
    if num_channels == 1
        rotated_img = zeros(new_height, new_width, 'uint8');
    else
        rotated_img = zeros(new_height, new_width, num_channels, 'uint8');
    end
    
    % Compute the inverse transformation for each pixel in the new image
    for x = 1:new_width
        for y = 1:new_height
            % Map the pixel (x, y) in the new image to the original image
            old_coords = T \ ([x + min_x - 1; y + min_y - 1] - [orig_width / 2; orig_height / 2]);
            old_x = round(old_coords(1) + orig_width / 2);
            old_y = round(old_coords(2) + orig_height / 2);
            
            % If the mapped coordinates are within the bounds of the original image
            if old_x >= 1 && old_x <= orig_width && old_y >= 1 && old_y <= orig_height
                if num_channels == 1
                    rotated_img(y, x) = img(old_y, old_x);
                else
                    rotated_img(y, x, :) = img(old_y, old_x, :);
                end
            end
        end
    end
end

% Main script to load an image, rotate it, and display the result
function main()
    % Specify the file path
    file_path = 'image.jpg'; % Replace with your image file path
    
    % Load the image
    img = imread(file_path);
    
    % Define the rotation angle
    angle = 45; % Example angle in degrees
    
    % Rotate the image
    rotated_img = rotate_image(img, angle);
    
    % Display the original and rotated images
    figure;
    
    % Original image
    subplot(1, 2, 1);
    imshow(img);
    title('Original Image');
    
    % Rotated image
    subplot(1, 2, 2);
    imshow(rotated_img);
    title(['Rotated Image (', num2str(angle), '°)']);
end

% Call the main function
main();
