from django.shortcuts import render

def home(request):
    # Flag returning visitors
    return_visit = True

    if request.session.get('return_visit', False):
        return_visit = False
        request.session['return_visit'] = True

    return render(request, 'toomanydaves/home.html', {
        'return_visit': return_visit,
    })
