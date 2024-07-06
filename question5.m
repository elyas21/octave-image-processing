% Save this as resize_image_interpolation.m

% Function to resize an image using different interpolation techniques
function resized_img = resize_image(img, scale_factor, method)
    % Arguments:
    %   img (matrix): The input image.
    %   scale_factor (scalar): The factor by which to scale the image.
    %   method (string): The interpolation method ('nearest', 'bilinear', 'bicubic').

    % Get original dimensions
    [orig_height, orig_width, ~] = size(img);
    
    % Calculate new dimensions
    new_height = round(orig_height * scale_factor);
    new_width = round(orig_width * scale_factor);
    
    % Resize the image using the specified interpolation method
    if strcmp(method, 'nearest')
        resized_img = imresize(img, [new_height, new_width], 'nearest');
    elseif strcmp(method, 'bilinear')
        resized_img = imresize(img, [new_height, new_width], 'bilinear');
    elseif strcmp(method, 'bicubic')
        resized_img = imresize(img, [new_height, new_width], 'bicubic');
    else
        error('Unsupported interpolation method');
    end
end

% Main script to load the image, resize it using different methods, and display the results
function main()
    % Specify the file path
    file_path = 'path/to/your/image.jpg'; % Replace with your image file path
    
    % Load the image
    img = imread(file_path);
    
    % Define the scale factor
    scale_factor = 2; % Example scale factor
    
    % Resize the image using different interpolation methods
    tic;
    resized_nearest = resize_image(img, scale_factor, 'nearest');
    time_nearest = toc;
    
    tic;
    resized_bilinear = resize_image(img, scale_factor, 'bilinear');
    time_bilinear = toc;
    
    tic;
    resized_bicubic = resize_image(img, scale_factor, 'bicubic');
    time_bicubic = toc;
    
    % Display the original and resized images
    figure;
    
    % Original image
    subplot(2, 2, 1);
    imshow(img);
    title('Original Image');
    
    % Nearest neighbor resized image
    subplot(2, 2, 2);
    imshow(resized_nearest);
    title(['Nearest Neighbor (', num2str(time_nearest), ' s)']);
    
    % Bilinear resized image
    subplot(2, 2, 3);
    imshow(resized_bilinear);
    title(['Bilinear (', num2str(time_bilinear), ' s)']);
    
    % Bicubic resized image
    subplot(2, 2, 4);
    imshow(resized_bicubic);
    title(['Bicubic (', num2str(time_bicubic), ' s)']);
    
    % Print comparison of execution times
    fprintf('Execution time for nearest neighbor: %.4f seconds\n', time_nearest);
    fprintf('Execution time for bilinear: %.4f seconds\n', time_bilinear);
    fprintf('Execution time for bicubic: %.4f seconds\n', time_bicubic);
end

% Call the main function
main();
