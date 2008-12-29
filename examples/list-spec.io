#!/usr/bin/env iospec

describe(List,
	
	describe(sort, "sort",
		setup(
			l := list
		)

		describe(emptyList, "(empty list)",
			emptyList("should create a new list",
				verify(l sort uniqueId != l uniqueId)
			)

			emptyList("should be zero size",
				// We can check equality with the default verify
				l sort verify(size == 0, "#{l sort size} is not equal to 0" interpolate)
				// Or with the verifyEqual helper
				l sort size verifyEqual(0)
			)
		)

		describe(singleItemList, "(list size == 1)",
			setup(
				l append(13)
				value := 13
			)

			singleItemList("should create a new list",
				verify(l sort uniqueId != l uniqueId)
			)

			singleItemList("should have a size of 1",
				l sort verify(size == 1)
			)

			singleItemList("should contain the old value",
				verify(l at(0) == value)
			)
		)

		describe(twoNumbers, "(two numbers)",
			
			twoNumbers("should swap out of order numbers",
				l append(2, 1)
				l sort verify(== list(1, 2))
			)

			twoNumbers("should leave sorted items in the same order",
				l append(1, 2)
				l sort verify(== list(1, 2))
			)
		)
	)
)
