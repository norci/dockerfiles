c.NotebookApp.allow_root = True
c.NotebookApp.ip = '0.0.0.0'
from notebook.auth import passwd
c.NotebookApp.password = passwd("example")
