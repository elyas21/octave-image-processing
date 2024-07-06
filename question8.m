function capture_and_adjust_image(device, brightness, contrast)
  % Capture an image from the camera
  % device: the camera device (e.g., /dev/video0 for Linux, "0" for Windows)
  % brightness: the brightness adjustment (-1.0 to 1.0, where 0 is no change)
  % contrast: the contrast adjustment (0 to 3, where 1 is no change)

  % Default device for Linux
  if nargin < 1
    device = '/dev/video0';
  end

  % Default brightness and contrast
  if nargin < 2
    brightness = 0;
  end
  if nargin < 3
    contrast = 1;
  end

  % Command to capture an image using fswebcam (for Linux)
  % For Windows/Mac, you might use a different command like ffmpeg
  system(['fswebcam --device ' device ' --no-banner captured_image.jpg']);

  % Load the captured image
  img = imread('captured_image.jpg');

  % Adjust brightness
  img = imadjust(img, [], [], 1, brightness);

  % Adjust contrast
  img = imadjust(img, stretchlim(img), [], contrast);

  % Display the adjusted image
  imshow(img);

  % Save the adjusted image
  imwrite(img, 'adjusted_image.jpg');

  disp('Image captured and adjusted.');
end
