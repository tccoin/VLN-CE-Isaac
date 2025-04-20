VLN_PATH=/isaac-sim/VLN
DOWNLOAD_WEIGHTS=false

# wget -O segment_anything/sam_vit_h_4b8939.pth https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth
# wget -O GroundingDINO/groundingdino_swint_ogc.pth https://github.com/IDEA-Research/GroundingDINO/releases/download/v0.1.0-alpha/groundingdino_swint_ogc.pth
mkdir -p $VLN_PATH/third_party/GLIP/MODEL
wget -O $VLN_PATH/third_party/GLIP/MODEL/glip_large_model.pth https://huggingface.co/GLIPModel/GLIP/resolve/main/glip_large_model.pth

pip uninstall habitat-lab segment_anything GroundingDINO maskrcnn_benchmark vln

cd $VLN_PATH/third_party \
&& pip install -e habitat-lab

export GSA_PATH=$VLN_PATH/third_party/segment_anything/
cd $VLN_PATH/third_party \
&& pip install -e segment_anything
IF 

cd $VLN_PATH/third_party \
&& pip install --no-build-isolation -e GroundingDINO

cd $VLN_PATH/third_party/GLIP \
&& python setup.py build develop --user

cd $VLN_PATH
pip install -e .