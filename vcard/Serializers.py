from rest_framework import serializers
from .models import MVCard

class MVCardSerializer(serializers.ModelSerializer):
    class Meta:
        model = MVCard
        fields = ('pk', 'image', 'name', 'address', 'designation', 'email', 'phone', 'git', 'linkedin', 'website', )
        read_only_fields = ('pk', 'name', 'address', 'designation', 'email', 'phone', 'git', 'linkedin', 'website', )
