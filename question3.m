% Save this as grayscale_conversion.m

% Function to convert an image to grayscale using the average method
function gray_img = grayscale_average(img)
    gray_img = mean(img, 3);
end

% Function to convert an image to grayscale using the luminosity method
function gray_img = grayscale_luminosity(img)
    gray_img = 0.21 * img(:, :, 1) + 0.72 * img(:, :, 2) + 0.07 * img(:, :, 3);
end

% Function to convert an image to grayscale using the desaturation method
function gray_img = grayscale_desaturation(img)
    max_val = max(img, [], 3);
    min_val = min(img, [], 3);
    gray_img = (max_val + min_val) / 2;
end

% Main script to load the image, convert it using different methods, and display the results
function main()
    % Specify the file path
    file_path = 'image.jpg'; % Replace with your image file path
    
    % Load the image
    img = imread(file_path);
    
    % Apply grayscale conversion methods
    gray_avg = grayscale_average(img);
    gray_lum = grayscale_luminosity(img);
    gray_des = grayscale_desaturation(img);
    
    % Display the original and grayscale images
    figure;
    
    % Original image
    subplot(2, 2, 1);
    imshow(img);
    title('Original Image');
    
    % Average method grayscale image
    subplot(2, 2, 2);
    imshow(gray_avg, []);
    title('Average Method');
    
    % Luminosity method grayscale image
    subplot(2, 2, 3);
    imshow(gray_lum, []);
    title('Luminosity Method');
    
    % Desaturation method grayscale image
    subplot(2, 2, 4);
    imshow(gray_des, []);
    title('Desaturation Method');
end

% Call the main function
main();
