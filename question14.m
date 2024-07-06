pkg load image; % Load the image package

function enhance_image(image_path)
  % Load the original image
  img_original = imread(image_path);
  img_gray = rgb2gray(img_original); % Convert to grayscale for simplicity

  % Histogram Equalization
  img_hist_eq = histeq(img_gray);

  % Contrast Stretching
  min_val = double(min(img_gray(:)));
  max_val = double(max(img_gray(:)));
  img_contrast_stretch = imadjust(img_gray, [min_val/255; max_val/255], [0; 1]);

  % Display the results
  figure;
  
  % Original grayscale image
  subplot(2, 2, 1);
  imshow(img_gray);
  title('Original Grayscale Image');
  
  % Histogram Equalized image
  subplot(2, 2, 2);
  imshow(img_hist_eq);
  title('Histogram Equalization');
  
  % Contrast Stretched image
  subplot(2, 2, 3);
  imshow(img_contrast_stretch);
  title('Contrast Stretching');
  
  % Display histograms
  subplot(2, 2, 4);
  hold on;
  histogram(img_gray, 'FaceColor', 'b');
  histogram(img_hist_eq, 'FaceColor', 'g');
  histogram(img_contrast_stretch, 'FaceColor', 'r');
  legend('Original', 'Histogram Eq', 'Contrast Stretch');
  title('Histograms');
  hold off;
  
  % Discuss the results
  disp('Image Enhancement Techniques:');
  disp('1. Histogram Equalization:');
  disp('   - Improves contrast by redistributing the intensities.');
  disp('   - The resulting image has a more uniform histogram.');
  disp('   - Useful for images with poor contrast.');
  
  disp('2. Contrast Stretching:');
  disp('   - Adjusts the intensity values to span the full range.');
  disp('   - Enhances the contrast by making full use of the intensity range.');
  disp('   - Useful for enhancing the visibility of features.');
end

% Usage example
image_path = 'image.jpg';
enhance_image(image_path);
