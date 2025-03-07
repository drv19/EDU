from django.db import models

class Departamento(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre

class Municipio(models.Model):
    nombre = models.CharField(max_length=100)
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)

    def __str__(self):
        return self.nombre

class Direccion(models.Model):
    lugar = models.CharField(max_length=100)
    municipio = models.ForeignKey(Municipio, on_delete=models.CASCADE)
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)

    def __str__(self):
        return self.lugar

class Tutor(models.Model):
    nombre = models.CharField(max_length=100)
    telefono1 = models.IntegerField()
    telefono2 = models.IntegerField(blank=True, null=True)
    telefono3 = models.IntegerField(blank=True, null=True)
    direccion = models.ForeignKey(Direccion, on_delete=models.CASCADE)

    def __str__(self):
        return self.nombre

class Estado(models.Model):
    estado = models.CharField(max_length=100)

    def __str__(self):
        return self.estado

class Estudiante(models.Model):
    minucia = models.CharField(max_length=100)
    coding_edu = models.CharField(max_length=50)
    centro_edu = models.IntegerField()
    nombre = models.CharField(max_length=100)
    edad = models.IntegerField()
    fecha = models.DateTimeField()
    tutor = models.ForeignKey(Tutor, on_delete=models.CASCADE)
    direccion = models.ForeignKey(Direccion, on_delete=models.CASCADE)
    estado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    def __str__(self):
        return self.nombre