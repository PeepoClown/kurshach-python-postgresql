import psycopg2
from PyQt5.QtWidgets import QMainWindow
from PyQt5.QtCore import QSize


class TaskViewWindow(QMainWindow):
	def __init__(self, connectionStr):
		super().__init__()

		self.setMinimumSize(QSize(800, 600))
		self.connectionStr = connectionStr

		self.show()
