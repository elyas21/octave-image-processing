% Save this as crop_image.m

% Function to crop an image to a specific region of interest
function cropped_img = crop_image(img, top_left, bottom_right)
    % Arguments:
    %   img (matrix): The input image.
    %   top_left (vector): Coordinates of the top-left corner of the crop region [x, y].
    %   bottom_right (vector): Coordinates of the bottom-right corner of the crop region [x, y].
    
    % Validate the input coordinates
    if any(top_left < 1) || any(bottom_right > [size(img, 2), size(img, 1)]) || any(bottom_right <= top_left)
        error('Invalid crop coordinates');
    end
    
    % Extract the region of interest
    x1 = top_left(1);
    y1 = top_left(2);
    x2 = bottom_right(1);
    y2 = bottom_right(2);
    
    cropped_img = img(y1:y2, x1:x2, :);
end

% Main script to load an image, crop it, and display the result
function main()
    % Specify the file path
    file_path = 'image.jpg'; % Replace with your image file path
    
    % Load the image
    img = imread(file_path);
    
    % Define the coordinates of the crop region
    top_left = [50, 50];  % Replace with your top-left coordinates [x, y]
    bottom_right = [200, 200]; % Replace with your bottom-right coordinates [x, y]
    
    % Crop the image
    cropped_img = crop_image(img, top_left, bottom_right);
    
    % Display the original and cropped images
    figure;
    
    % Original image
    subplot(1, 2, 1);
    imshow(img);
    title('Original Image');
    
    % Cropped image
    subplot(1, 2, 2);
    imshow(cropped_img);
    title('Cropped Image');
end

% Call the main function
main();
