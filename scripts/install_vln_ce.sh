ln -s /root/Projects/VLN-CE-Isaac/isaaclab_exts/omni.isaac.vlnce /dependencies/IsaacLab/source/extensions
ln -s /root/Projects/VLN-CE-Isaac/isaaclab_exts/omni.isaac.matterport /dependencies/IsaacLab/source/extensions

cd /dependencies/IsaacLab
bash isaaclab.sh -i none
bash isaaclab.sh -p -m pip install -e /root/Projects/VLN-CE-Isaac/scripts/rsl_rl
