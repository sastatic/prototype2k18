# Generated by Django 2.1.2 on 2018-10-20 00:04

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='MVCard',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(blank=True, max_length=300, null=True)),
                ('designation', models.CharField(blank=True, max_length=70, null=True)),
                ('email', models.EmailField(blank=True, max_length=70, null=True)),
                ('phone', models.CharField(blank=True, max_length=100, null=True)),
                ('git', models.CharField(blank=True, max_length=100, null=True)),
                ('linked', models.CharField(blank=True, max_length=100, null=True)),
                ('website', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
    ]
