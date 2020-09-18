[clip F]=audioread('cut6.mp3');
%sound(clip,F);
n=length(clip);
%clip the signal
N=19;  %from n
clip=clip(1:2^N); 

%sound(f,F)

%figure(1)
%clf
%plot(clip)
%fft of  shifted one
clip_actual=abs(fftshift(fft(clip)));

%filtered version of fft
array=[-2^(N-1):2^(N-1)-1];
clipfft_filt=fftshift(fft(clip));
clipfft_filt(abs(array)>70000)  =0;
%clipfft_filt(abs(array)<2000)  =0;
clipfft_filt_absolute=abs(clipfft_filt);

figure(1)
clf
subplot(2,1,1)
plot(clip_actual,'r') %absolute value of shifted fft of clip
subplot(2,1,2)
plot(clipfft_filt_absolute,'b') %absolute vlue of shifted fft after filtering the clip

%listening to filtered clip
clip_filt=5* real(ifft(fftshift(clipfft_filt))); %amplification
bgm=clip_filt;
sound(clip,F)  %actual clip
%sound(bgm,F) %after suppressing voice dialogue or word




