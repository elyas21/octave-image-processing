% Save this as download_images.m

% Function to download images from specified URLs and save them locally
function download_images(urls, dest_dir)
    % Arguments:
    %   urls (cell array of strings): List of URLs to download images from.
    %   dest_dir (string): Directory to save the downloaded images.
    
    % Create the destination directory if it does not exist
    if ~exist(dest_dir, 'dir')
        mkdir(dest_dir);
    end
    
    % Loop through each URL
    for i = 1:length(urls)
        url = urls{i};
        try
            % Determine the file format from the URL
            [~, name, ext] = fileparts(url);
            if isempty(ext)
                error('URL does not have a valid image file extension');
            end
            
            % Define the local file path
            local_file = fullfile(dest_dir, [name, ext]);
            
            % Download the image
            urlwrite(url, local_file);
            fprintf('Successfully downloaded %s\n', local_file);
            
        catch ME
            % Handle and log any issues during the download
            fprintf('Error downloading %s: %s\n', url, ME.message);
        end
    end
    
    % Display the downloaded images
    image_files = dir(fullfile(dest_dir, '*'));
    for i = 1:length(image_files)
        [~, ~, ext] = fileparts(image_files(i).name);
        if ismember(lower(ext), {'.png', '.jpg', '.jpeg', '.bmp'})
            img = imread(fullfile(dest_dir, image_files(i).name));
            figure;
            imshow(img);
            title(image_files(i).name);
        end
    end
end

% Main script to call the download_images function
function main()
    % Specify the URLs of the images to download
    urls = {
        'https://example.com/image1.jpg',
        'https://example.com/image2.png',
        'https://example.com/image3.bmp'
    };
    
    % Specify the destination directory
    dest_dir = 'downloaded_images';
    
    % Download the images
    download_images(urls, dest_dir);
end

% Call the main function
main();
