def compare_version(version1, version2)
  version_one = version1.split('.').map(&:to_i)
  version_two = version2.split('.').map(&:to_i)

  version_one.each_with_index do |version, i|
    return -1 if version < (version_two[i] || 0)
    return 1 if version > (version_two[i] || 0)
  end

  version_two.each_with_index do |version, i|
    return 1 if version < (version_one[i] || 0)
    return -1 if version > (version_one[i] || 0)
  end

  0
end

result = compare_version('1.2', '1.10')
puts result == -1 ? 'passed' : 'failed'

result = compare_version('1.01', '1.001')
puts result.zero? ? 'passed' : 'failed'

result = compare_version('1', '1.1')
puts result == -1 ? 'passed' : 'failed'
