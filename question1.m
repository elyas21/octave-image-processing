function import_and_display_images(directory)
    % Import and display images from a specified directory using different colormaps.
    % Arguments:
    %   directory (string): The path to the directory containing image files.
    
    % Supported image formats
    image_formats = {"*.png", "*.jpeg", "*.jpg", "*.bmp"};
    
    % Collect all image files from the specified directory
    image_files = [];
    for i = 1:length(image_formats)
        files = dir(fullfile(directory, image_formats{i}));
        image_files = [image_files; files];
    end
    
    % Check if no images were found
    if isempty(image_files)
        disp("No images found in the specified directory.");
        return;
    end
    
    % Loop through each image file
    for i = 1:length(image_files)
        try
            % Construct full file path
            file_path = fullfile(directory, image_files(i).name);
            
            % Read the image
            img = imread(file_path);
            
            % Display the image with different colormaps
            figure;
            
            % Grayscale colormap
            subplot(1, 3, 1);
            imshow(img);
            colormap('gray');
            title([image_files(i).name, ' - Grayscale']);
            
            % Hot colormap
            subplot(1, 3, 2);
            imshow(img);
            colormap('hot');
            title([image_files(i).name, ' - Hot']);
            
            % Jet colormap
            subplot(1, 3, 3);
            imshow(img);
            colormap('jet');
            title([image_files(i).name, ' - Jet']);
            
        catch ME
            % Handle errors during image reading
            fprintf('Error reading image %s: %s\n', image_files(i).name, ME.message);
        end
    end
end
