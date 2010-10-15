module HomeHelper
  def englishJoin(arr)
    return '' if not arr
    case arr.size
    when 0 then ''
    when 1 then arr[0]
    when 2 then arr.join(' and ')
    else arr[0..-2].join(', ') + ', and ' + arr[-1]
    end
  end
  def have(n)
    if n == 1
      return 'has'
    elsif n > 1
      return 'have'
    else return 'GNARK!'
    end
  end
end
