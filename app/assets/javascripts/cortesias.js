function mostrar(f,m) 
{
    element = document.getElementById(f);
    check = document.getElementById(m);
    if (check.checked) 
    {
        element.style.display='block';
    }
    else 
    {
        element.style.display='none';
    }
}
