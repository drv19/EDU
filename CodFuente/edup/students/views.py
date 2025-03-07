from django.shortcuts import render
from django.views.generic import TemplateView
# Create your views here.

class Student(TemplateView):
    template_name = 'students/liststudents.html'
