///sort any value in a list
/proc/sort_list(list/list_to_sort, cmp=/proc/cmp_text_asc)
	return sortTim(list_to_sort.Copy(), cmp)
