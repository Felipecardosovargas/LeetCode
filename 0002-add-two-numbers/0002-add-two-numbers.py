class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def addTwoNumbers(self, l1, l2):
        dummy_head = ListNode(0)
        p = l1
        q = l2
        current = dummy_head
        carry = 0
        
        while p is not None or q is not None:
            x = p.val if p else 0
            y = q.val if q else 0
            sum = x + y + carry
            carry = sum // 10
            current.next = ListNode(sum % 10)
            current = current.next
            if p:
                p = p.next
            if q:
                q = q.next
        
        if carry > 0:
            current.next = ListNode(carry)
        
        return dummy_head.next
