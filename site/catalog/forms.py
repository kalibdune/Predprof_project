from django import forms

from core.forms import FormStyleMixin
from catalog.models import Site


class CreateUserSiteForm(forms.ModelForm, FormStyleMixin):
    class Meta:
        model = Site
        fields = ('name', 'url', 'logo', 'description')


class UpdateUserSiteForm(forms.ModelForm, FormStyleMixin):
    class Meta:
        model = Site
        fields = ('name', 'url', 'logo', 'description')
        widgets = {
            'logo': forms.FileInput(),
        }
        labels = {
            'logo': 'Изменить логотип'
        }
