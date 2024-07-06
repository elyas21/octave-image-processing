% Save this as resize_image.m

% Function to resize an image while maintaining aspect ratio
function resized_img = resize_image(img, target_width, target_height)
    % Get original dimensions
    [orig_height, orig_width, ~] = size(img);
    
    % Calculate aspect ratios
    aspect_ratio_orig = orig_width / orig_height;
    aspect_ratio_target = target_width / target_height;
    
    % Determine the new dimensions
    if aspect_ratio_orig > aspect_ratio_target
        new_width = target_width;
        new_height = round(target_width / aspect_ratio_orig);
    else
        new_height = target_height;
        new_width = round(target_height * aspect_ratio_orig);
    end
    
    % Resize the image
    resized_img = imresize(img, [new_height, new_width]);
end

% Main script to load, resize, and display the image
function main()
    % Specify the file path and target dimensions
    file_path = 'image.jpg'; % Replace with your image file path
    target_width = 300; % Example target width
    target_height = 300; % Example target height
    
    % Load the image
    img = imread(file_path);
    
    % Resize the image
    resized_img = resize_image(img, target_width, target_height);
    
    % Display the original and resized images
    figure;
    
    % Original image
    subplot(1, 2, 1);
    imshow(img);
    title('Original Image');
    
    % Resized image
    subplot(1, 2, 2);
    imshow(resized_img);
    title('Resized Image');
    
    % Compare quality and resolution
    fprintf('Original Image - Width: %d, Height: %d\n', size(img, 2), size(img, 1));
    fprintf('Resized Image - Width: %d, Height: %d\n', size(resized_img, 2), size(resized_img, 1));
end

% Call the main function
main();
