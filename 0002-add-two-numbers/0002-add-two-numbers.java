// Definição da classe Solution para resolver o problema
class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode dummyHead = new ListNode(0);
        ListNode p = l1, q = l2, current = dummyHead;
        int carry = 0;
        
        while (p != null || q != null) {
            // Obtemos os valores atuais de l1 e l2, ou 0 se chegarmos ao final da lista
            int x = (p != null) ? p.val : 0;
            int y = (q != null) ? q.val : 0;
            int sum = x + y + carry;
            carry = sum / 10;  // Determina o novo valor do carry
            current.next = new ListNode(sum % 10);  // Cria um novo nó para o resultado da soma
            current = current.next;  // Avança para o próximo nó na lista resultante
            if (p != null) p = p.next;
            if (q != null) q = q.next;
        }
        
        if (carry > 0) {
            current.next = new ListNode(carry);
        }
        
        return dummyHead.next;
    }
}

   