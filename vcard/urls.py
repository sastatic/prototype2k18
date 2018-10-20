from django.urls import path, include
from rest_framework import routers
from .views import MVCardViewSet

router = routers.DefaultRouter()
router.register(r'images', MVCardViewSet, 'images')

urlpatterns = [
    path('', include(router.urls)),
]
