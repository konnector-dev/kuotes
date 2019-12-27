<?php
declare(strict_types=1);

namespace App\Controller;

use Cake\Http\Response;

/**
 * Users Controller
 *
 *
 * @method \App\Model\Entity\User[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class UsersController extends AppController
{
    /**
     * @var \Cake\Datasource\RepositoryInterface|null
     */

    /**
     * Index method
     *
     * @return Response|null
     */
    public function index()
    {
        $users = $this->paginate($this->Users);

        $this->set('users', $users);
        $this->viewBuilder()->setOption('serialize', ['users']);
    }

    /**
     * View method
     *
     * @param string|null $id User id.
     * @return Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $user = $this->Users->get($id);

        $this->set('user', $user);
        $this->viewBuilder()->setOption('serialize', ['user']);
    }

    /**
     * Add method
     *
     * @return Response|null Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $status = 'error';
        if ($this->request->is(['post'])) {
            $form = [
                'id' => $this->request->getData('password'),
                'password' => $this->request->getData('password'),
                'email' => $this->request->getData('email'),
            ];
            $user = $this->Users->newEntity($form);
            if ($this->Users->save($user)) {
                $status = 'success';
            }
        }
        $this->set(compact('user', 'status'));
        $this->viewBuilder()->setOption('serialize', ['user', 'status']);
    }

    /**
     * Edit method
     *
     * @param string|null $id User id.
     * @return Response|null Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $status = 'error';
        $user = $this->Users->get($id);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $user = $this->Users->patchEntity($user, $this->request->getData());
            if ($this->Users->save($user)) {
                $status = 'success';
            }
        }
        $this->set(compact('user'));
        $this->viewBuilder()->setOption('serialize', ['user', 'status']);
    }

    /**
     * Delete method
     *
     * @param string|null $id User id.
     * @return Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $user = $this->Users->get($id);
        if ($this->Users->delete($user)) {
            $this->Flash->success(__('The user has been deleted.'));
        } else {
            $this->Flash->error(__('The user could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
