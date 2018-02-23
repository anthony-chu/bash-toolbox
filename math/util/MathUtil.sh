include base.comparator.BaseComparator

include string.validator.StringValidator

@class
MathUtil(){
	decrement(){
		difference ${1} 1
	}

	difference(){
		echo $((${1}-${2}))
	}

	format(){
		if [[ ${1} -le 9 ]]; then
			echo 0${1}
		else
			echo ${1}
		fi
	}

	increment(){
		if [[ ! ${1} ]]; then
			echo $((+1))
		else
			sum ${1} 1
		fi
	}

	isDivisible(){
		BaseComparator isEqual $(modulus ${1} ${2}) 0
	}

	isEven(){
		isDivisible ${1} 2
	}

	isOdd(){
		if [[ ! $(isEven ${1}) ]]; then
			echo true
		fi
	}

	modulus(){
		local var=${1}

		if [[ $(StringValidator beginsWith 0 ${var}) ]]; then
			local var=${var//0/}
		fi

		echo $((${var}%${2}))
	}

	exp(){
		local base=${1}
		local exponent=${2}

		echo $((${1}**${2}))
	}

	product(){
		local _product=1

		while [[ $@ ]]; do
			local _product=$((_product*${1}))

			shift
		done

		echo ${_product}
	}

	quotient(){
		echo $((${1}/${2}))
	}

	sum(){
		local _sum=0

		while [[ $@ ]]; do
			local _sum=$((_sum+${1}))

			shift
		done

		echo ${_sum}
	}

	$@
}