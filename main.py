import sys
import psycopg2
from functools import partial
from PyQt5 import QtCore, QtWidgets, QtGui
from PyQt5.QtWidgets import QMainWindow, QMessageBox, QLabel, QPushButton, QLineEdit
from PyQt5.QtCore import QSize
from PyQt5.QtGui import QIcon, QPixmap, QCursor


class SomeWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setMinimumSize(QSize(800, 600))
        self.show()


class AuthorizationWindow(QMainWindow):
    def __init__(self, parent, username):
        super().__init__()

        self.setWindowTitle("Authorization")
        geo = self.geometry()
        geo.moveCenter(parent.geometry().center())
        self.setGeometry(geo)
        self.username = username
        self.parentWindow = parent

        loginLabel = QLabel("Login as " + username, self)
        loginLabel.setGeometry(250, 150, 200, 30)
        loginLabel.setStyleSheet('''
            font-size: 20px;
        ''')
        passwdLabel = QLabel("type password: ", self)
        passwdLabel.setGeometry(200, 200, 130, 30)
        passwdLabel.setStyleSheet('''
            font-size: 16px;
        ''')
        self.passwdEdit = QLineEdit(self)
        self.passwdEdit.setGeometry(330, 200, 150, 30)
        self.passwdEdit.setStyleSheet('''
            font-size: 16px;
        ''')
        self.submitButton = QPushButton("Submit", self)
        self.submitButton.setGeometry(280, 260, 150, 40)
        self.submitButton.setStyleSheet('''
            font-size: 18px;
            color: #ede8df;
            background-color: #e3827b;
            border-radius: 12px;
            padding: 5px 10px;
        ''')
        self.submitButton.clicked.connect(self.submitButtonPressed)
        self.submitButton.setCursor(QCursor(QtCore.Qt.PointingHandCursor))

        self.show()

    def submitButtonPressed(self):
        try:
            conncetionStr = "dbname='testdb' user='%s' password='%s'" % (self.username, self.passwdEdit.text())
            connection = psycopg2.connect(conncetionStr)
            msgBox = QMessageBox(QMessageBox.Information, "Login", "Login on user: " + self.username,
                                 QMessageBox.Ok | QMessageBox.Cancel, self)
            msgBox.exec()
            self.close()
            self.parentWindow.close()

            self.win = SomeWindow()

        except Exception as exception:
            msgBox = QMessageBox(QMessageBox.Critical, "Error", "Error: " + str(exception),
                                 QMessageBox.Ok | QMessageBox.Cancel, self)
            msgBox.exec()


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Scheduler")
        self.setMinimumSize(QSize(800, 600))

        programIconLabel = QLabel(self)
        programNameLabel = QLabel("Scheduler", self)
        programIconLabel.setPixmap(QPixmap("img/mainWindowIcon.png"))
        programIconLabel.setGeometry(50, 30, 32, 32)
        programNameLabel.setStyleSheet('''
            font-size: 20px;
            text-transform: uppercase;
        ''')
        programNameLabel.setGeometry(90, 30, 130, 30)

        self.dbUsers = []
        try:
            self.dbConnection()
        except Exception as exception:
            self.close()
            msgBox = QMessageBox(QMessageBox.Critical, "Error", "Error: " + str(exception),
                                 QMessageBox.Ok | QMessageBox.Cancel, self)

        self.userAccessButtons = []
        for i in range(0, len(self.dbUsers)):
            self.userAccessButtons.append(QPushButton(self.dbUsers[i], self))
            self.userAccessButtons[i].setGeometry(330, 200 + i * 55, 150, 40)
            self.userAccessButtons[i].setStyleSheet('''
                font-size: 18px;
                color: #ede8df;
                background-color: #fca503;
                border-radius: 12px;
                padding: 5px 10px;
            ''')
            self.userAccessButtons[i].clicked.connect(partial(self.userAccessButtonPressed, self.dbUsers[i]))
            self.userAccessButtons[i].setCursor(QCursor(QtCore.Qt.PointingHandCursor))

        self.show()

    def dbConnection(self):
        connection = psycopg2.connect("dbname='testdb' user='dmitriy' password='12345'")
        cursor = connection.cursor()
        cursor.execute('SELECT usename FROM pg_catalog.pg_user;')
        for i in cursor.fetchall():
            self.dbUsers.append(i[0])

    def userAccessButtonPressed(self, username):
        self.authWin = AuthorizationWindow(self, username)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    mainWin = MainWindow()
    sys.exit(app.exec())
