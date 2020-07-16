% analysis the fused image
clear all;
clc;
addpath('./vif');
disp('----------analysis_main_infrared_average------------');

% please replace the image paths
fileName_source1 = './images/IR1.png';
fileName_source2 = './images/VIS1.png';
fileName_fused = './images/fused_nestfuse_1e2_avg_1.png';

% 融合结果
fusedImage = imread(fileName_fused);
% 输入图
sourceImage1 = imread(fileName_source1);
sourceImage2 = imread(fileName_source2);
tic;
metrics = analysis_metrics_7(fusedImage,sourceImage1,sourceImage2);
toc;
% EN, SD, MI, FMI_dct, FMI_w, SSIM, VIF
values = [metrics.EN, metrics.SD, metrics.MI, metrics.FMI_dct, metrics.FMI_w, metrics.SSIM, metrics.VIF];

disp(['EN:', num2str(metrics.EN), ', SD:', num2str(metrics.SD), ', MI:', num2str(metrics.MI), ...
     ', FMI_dct:', num2str(metrics.FMI_dct), ', FMI_w:', num2str(metrics.FMI_w), ', SSIM:', num2str(metrics.SSIM), ...
     ', VIF:', num2str(metrics.VIF)]);