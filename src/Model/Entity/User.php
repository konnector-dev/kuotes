<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\Auth\DefaultPasswordHasher;
use Cake\I18n\FrozenTime;
use Cake\ORM\Entity;

/**
 * User Entity
 *
 * @property int $id
 * @property string|null $name
 * @property string $email
 * @property string $password
 * @property bool|null $is_admin
 * @property FrozenTime|null $email_verified_at
 * @property int|null $status
 * @property FrozenTime|null $created
 * @property FrozenTime|null $modified
 *
 * @property UserLogin[] $user_logins
 */
class User extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        'name' => true,
        'email' => true,
        'password' => true,
        'is_admin' => true,
        'email_verified_at' => true,
        'status' => true,
        'created' => true,
        'modified' => true,
        'uid' => true,
        'user_logins' => true,
    ];

    /**
     * Fields that are excluded from JSON versions of the entity.
     *
     * @var array
     */
    protected $_hidden = [
        'password',
        'id',
        'created',
    ];

    protected function _setPassword($password)
    {
        if ($password !== '') {
            return (new DefaultPasswordHasher())->hash($password);
        }
    }
}
