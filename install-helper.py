import os
import glob
import uuid

#       <ComponentRef Id="jbo"/>

for filename in glob.glob(r"espeak-ng-data\voices\!v\*"):
	bb = os.path.basename(filename)
	guid_str = str(uuid.uuid4()).upper()
	# print(filename)
	print("""<ComponentRef Id="%s"/>""" % (bb))
	continue
	print("""<Component Id="%s" Win64="$(var.Win64)" Guid="%s">
                  <File Name="%s" Source="$(var.ProjectDir)..\..\..\espeak-ng-data\voices\!v\%s" KeyPath="yes"/>
                </Component>""" % (bb, guid_str, bb, bb))