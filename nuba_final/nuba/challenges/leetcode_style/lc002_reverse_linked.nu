# LeetCode Style: Reverse Linked List

class Node { fun init(self,v){ self.val=v; self.next=null } }
fun reverse_list(head){
    let prev=null; let curr=head
    while curr!=null {
        let nxt=curr.next; curr.next=prev; prev=curr; curr=nxt
    }
    return prev
}
fun to_list(head){ let r=[]; let c=head; while c!=null { push(r,c.val); c=c.next }; return r }
let n1=new Node(1); let n2=new Node(2); let n3=new Node(3)
n1.next=n2; n2.next=n3
print(to_list(reverse_list(n1)))
