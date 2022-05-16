cd ..

python train_dalle_decoder.py \
    --schedule_sampler uniform \
    --lr 6e-5 \
    --weight_decay 0 \
    --lr_anneal_steps 800000 \
    --batch_size 16 \
    --microbatch -1 \
    --ema_rate 0.9999 \
    --log_interval 10 \
    --save_interval 100000 \
    --use_fp16 False \
    --fp16_scale_growth 1e-3 \
    --gradient_clipping 0.01 \
    --model_name diffusion_dalle_decoder_final_2_lr \
    --image_size 64 \
    --num_channels 256 \
    --num_res_blocks 3 \
    --num_heads -1 \
    --num_heads_upsample -1 \
    --num_head_channels 64 \
    --attention_resolutions 32,16,8 \
    --channel_mult 1,2,3,4 \
    --dropout 0.1 \
    --class_cond False \
    --emb_cond True \
    --use_checkpoint False \
    --use_scale_shift_norm True \
    --resblock_updown True \
    --use_new_attention_order False \
    --img_emb_dim 512 \
    --learn_sigma True \
    --diffusion_steps 1000 \
    --noise_schedule cosine \
    --use_kl False \
    --predict_xstart False \
    --rescale_timesteps False \
    --rescale_learned_sigmas False \
    --resume_checkpoint ../log/diffusion_dalle_decoder_final/model400000.pt

: '
python ../sample_dalle_decoder.py \
    --clip_denoised True \
    --num_samples 1 \
    --batch_size 1 \
    --use_ddim False \
    --model_path ../log/diffusion/diffusion_dalle_decoder_final_2_lr/ema_0.9999_800000.pt \
    --out_path ../images/imagenet64/test \
    --img_id 3 \
    --guidance_scale 4 \
    --image_size 64 \
    --num_channels 256 \
    --num_res_blocks 3 \
    --num_heads -1 \
    --num_heads_upsample -1 \
    --num_head_channels 64 \
    --attention_resolutions 32,16,8 \
    --channel_mult 1,2,3,4 \
    --dropout 0.1 \
    --class_cond False \
    --emb_cond True \
    --use_checkpoint False \
    --use_scale_shift_norm True \
    --resblock_updown True \
    --use_fp16 False \
    --use_new_attention_order False \
    --img_emb_dim 512 \
    --learn_sigma True \
    --diffusion_steps 1000 \
    --noise_schedule cosine \
    --use_kl False \
    --predict_xstart False \
    --rescale_timesteps False \
    --rescale_learned_sigmas False \
    #--image_guidance_path ../images/imagenet64/groundtruth/image0.jpg \
    #--image_guidance_scale 0.003 \
'

cd shell_files