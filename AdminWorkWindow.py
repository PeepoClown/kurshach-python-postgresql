import psycopg2
from PyQt5.QtWidgets import QMainWindow
from PyQt5.QtCore import QSize


class AdminWorkWindow(QMainWindow):
    def __init__(self, connectionStr):
        super().__init__()

        self.setMinimumSize(QSize(1600, 900))

        try:
            connection = psycopg2.connect(connectionStr)
            cursor = connection.cursor()
            cursor.execute('SELECT table_name FROM information_schema.tables WHERE table_schema = \
                                \'public\' ORDER BY table_name;')
            for i in cursor.fetchall():
                print(i[0])
        except Exception as exception:
            print("zxc + " + str(exception))


        self.show()
