if !Object.prototype.uber?
	# this object inherits properties of argument with optional namespace
	Object.defineProperty Object.prototype, 'uber',
		enumerable: false
		value: (obj,ns) ->
			if obj?
				
				for key of obj
					if obj.hasOwnProperty key

						if !@hasOwnProperty key
							@[key] = obj[key]
						else if ns?
							nskey = ns+'_'+key
							if @hasOwnProperty( nskey ) || obj.hasOwnProperty( nskey )
								throw new Error 'Namespace conflict'
							@[nskey] = obj[key]
			@
else
	console.warn "Object.prototype.uber already defined"