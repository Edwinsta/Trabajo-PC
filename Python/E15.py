import pyautogui,time

time.sleep(5)
#Primer llenado de formulario
#Se responde a la primera pregunta en nuestro caso dc
pyautogui.click(x= 759, y = 384, clicks = 1)
#Ponemos una cita
pyautogui.click(x= 796, y = 530, clicks = 1)
pyautogui.typewrite("No es quien soy... sino que hago... eso es lo que me define.")
#Escogemos cual es la mejor hora del día para comer pastel
pyautogui.click(x= 809, y = 614, clicks = 1)
pyautogui.click(x= 774, y = 732, clicks = 1)
#Direccion de correo
pyautogui.click(x= 815, y = 721 , clicks = 1)
pyautogui.typewrite("falsemail@gmail.com")
#Se envia el formulario
pyautogui.click(x=757, y =769 , clicks = 1)
time.sleep(5)

#Volver a contestar el Formulario
pyautogui.click(x=762, y = 371, clicks = 1)
time.sleep(3)

#Segundo llenado de formulario
#Se responde a la primera pregunta en nuestro caso marvel
pyautogui.click(x= 758, y = 363, clicks = 1)
#Ponemos una cita
pyautogui.click(x= 751, y = 517, clicks = 1)
pyautogui.typewrite("Y yo soy ironman.")
#Escogemos cual es la mejor hora del día para comer pastel
pyautogui.click(x= 759, y = 613, clicks = 1)
pyautogui.click(x= 814, y = 819, clicks = 1)
#Direccion de correo
pyautogui.click(x= 775, y = 718 , clicks = 1)
pyautogui.typewrite("jaunelsphacker@gmail.com")
#Se envia el formulario
pyautogui.click(x=757, y =769 , clicks = 1)
time.sleep(5)
