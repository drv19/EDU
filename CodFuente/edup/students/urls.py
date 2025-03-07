from django.urls import path

from students.views import *

urlpatterns = [
    path('students/', Student.as_view(), name='liststudents'),
]