clc;
clear all;
N=2^8;
s_p=0:255; %正弦波一个周期的采样点数
sin_data=sin(2*pi*s_p/N);
% plot(sin_data,'r*');%打印我们的波形
% hold on;
% plot(sin_data);
% 定点化
fix_p_sin_data=fix(sin_data*127);
for i=1:N
    if fix_p_sin_data(i)<0
        fix_p_sin_data(i)=N+fix_p_sin_data(i);
    else
        fix_p_sin_data(i)=fix_p_sin_data(i);
    end
end
fid=fopen('sp_ram_256x8.mif','w+');
fprintf(fid,'WIDTH=8;\n');
fprintf(fid,'DEPTH=256;\n');
fprintf(fid,'ADDRESS_RADIX=UNS;\n');
fprintf(fid,'DATA_RADIX=UNS;\n');
fprintf(fid,'CONTENT BEGIN\n');
for i=0:N-1
fprintf(fid,'%d : %d;\n',i,fix_p_sin_data(i+1));    
end
%fprintf(fid,'%d : %d;\n',0:N-1,fix_p_sin_data);
fprintf(fid,'END;\n');
fclose(fid);


