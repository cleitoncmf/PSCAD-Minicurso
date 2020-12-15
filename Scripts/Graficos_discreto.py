import numpy as np
import matplotlib.pyplot as plt




# Exemplo: quase contínuo
x1 = np.linspace(0,0.1,10e4)
y1 = np.sin(120*np.pi*x1)

plt.plot(x1,y1)
plt.xlim([0,0.1])
plt.show()



# Exemplo: Discreto 1

x2 = np.linspace(0,0.1,100)
y2 = np.sin(120*np.pi*x2)


plt.plot(x2,y2,'o')
plt.xlim([0,0.1])
plt.show()


plt.plot(x2,y2,'--o')
plt.xlim([0,0.1])
plt.show()



# Exemplo: Discreto - pouco

x3 = np.linspace(0,0.1,20)
y3 = np.sin(120*np.pi*x3)


plt.plot(x3,y3,'o')
plt.xlim([0,0.1])
plt.show()


plt.plot(x3,y3,'--o')
plt.xlim([0,0.1])
plt.show()






# Exemplo: Discreto - muito

x4 = np.linspace(0,0.1,500)
y4 = np.sin(120*np.pi*x4)


plt.plot(x4,y4,'o')
plt.xlim([0,0.1])
plt.show()


plt.plot(x4,y4,'--o')
plt.xlim([0,0.1])
plt.show()