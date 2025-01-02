from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse

def index(request):
    #return HttpResponse("Welcome to My Website!")
    param = request.GET.get('param', 'Guest')  # Extract 'param', default to 'Guest' if not provided
    return HttpResponse(f"Hello, {param}!Welcome to My Website!")

