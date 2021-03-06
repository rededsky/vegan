### fitspecaccum returns fitted nls() models in item models. Here we
### provide interfaces for some "nls" class support functions, and
### others can be used in the similar way.

`predict.fitspecaccum` <-
    function(object, newdata, ...)
{
    mods <- object$models
    if (!missing(newdata)) {
        newdata <- drop(as.matrix(newdata))
        if (length(dim(newdata)) > 1)
            stop("function accepts only one variable as 'newdata'")
        drop(sapply(mods, predict, newdata = data.frame(x = newdata), ...))
    } else {
        drop(sapply(mods, predict, ...))
    }
}

`AIC.fitspecaccum` <-
    function(object, ..., k = 2)
{
    sapply(object$models, AIC, k = k, ...)
}

`deviance.fitspecaccum` <-
    function(object, ...)
{
    sapply(object$models, deviance, ...)
}
