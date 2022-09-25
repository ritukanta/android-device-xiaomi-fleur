import common
import re


def fullOTA_installed(info):
    OTA_installed(info)
    return


def incrementalOTA_installed(info):
    OTA_installed(info)
    return


def add_images(info, basename, dest):
    name = basename
    data = info.input_zip.read("IMAGES/" + basename)
    common.ZipWriteStr(info.output_zip, name, data)
    info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))


def OTA_installed(info):
    info.script.Print("Patching firmware images...")
    add_images(info, "vbmeta.img", "/dev/block/by-name/vbmeta")
    return
