from rest_framework import viewsets, filters
from .Serializers import MVCardSerializer
from .models import MVCard


class MVCardViewSet(viewsets.ModelViewSet):
    queryset = MVCard.objects.all()
    serializer_class = MVCardSerializer
