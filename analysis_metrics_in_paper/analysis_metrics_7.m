%% seven metrics
function metrics = analysis_metrics_7(image_f,image_1,image_2)

[s1,s2] = size(image_1);
imgSeq = zeros(s1, s2, 2);
imgSeq(:, :, 1) = image_1;
imgSeq(:, :, 2) = image_2;

image1 = im2double(image_1);
image2 = im2double(image_2);
image_fused = im2double(image_f);

metrics.EN = entropy(image_fused);
metrics.SD = analysis_sd(image_fused);
metrics.MI = analysis_MI(image_1,image_2,image_f);
metrics.FMI_dct = analysis_fmi(image1,image2,image_fused,'dct');
metrics.FMI_w = analysis_fmi(image1,image2,image_fused,'wavelet');
metrics.SSIM = (ssim(image_fused,image1)+ssim(image_fused,image2))/2;
metrics.VIF = (vifvec(image1, image_fused)+vifvec(image2, image_fused))/2;


end







