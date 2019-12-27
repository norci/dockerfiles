c.NotebookApp.allow_root = True
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.quit_button = False
c.NotebookApp.websocket_compression_options = {}

from notebook.auth import passwd;
c.NotebookApp.password = passwd("example")
