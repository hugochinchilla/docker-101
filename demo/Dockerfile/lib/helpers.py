import settings
import shutil
import os

def reset():
    shutil.rmtree(settings.DEMO_PATH, True)

